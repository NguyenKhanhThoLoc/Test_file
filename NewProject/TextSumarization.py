import nltk
from nltk.tokenize import sent_tokenize
from nltk.metrics import edit_distance
from networkx import Graph
from networkx import pagerank

class TextRankSummarizer:
    """
    Tóm tắt văn bản sử dụng thuật toán TextRank.

    Tham số:
        max_sentences: Số lượng câu tối đa trong tóm tắt.
    """
    def __init__(self, max_sentences):
        self.max_sentences = max_sentences

    def split_to_sentences(self, content):
        """
        Phân chia văn bản thành các câu.

        Tham số:
            content: Văn bản cần phân chia.

        Trả về:
            Danh sách các câu.
        """
        return sent_tokenize(content)

    def get_similarity_graph(self, sentences):
        """
        Tạo đồ thị thể hiện mức độ tương đồng giữa các câu.

        Tham số:
            sentences: Danh sách các câu.

        Trả về:
            Đồ thị thể hiện mức độ tương đồng giữa các câu.
        """
        graph = Graph()  # Create a NetworkX Graph object
        for i, s in enumerate(sentences):
            sentence_similarity = []
            for j, t in enumerate(sentences):
                if i != j:
                    similarity = 1 - edit_distance(s, t) / max(len(s), len(t))
                    sentence_similarity.append(similarity)
                    graph.add_edge(i, j, weight=similarity)  # Add edges with weights
        return graph

    def get_text_rank(self, similarity_graph):
        """
        Tính điểm TextRank cho mỗi câu.

        Tham số:
            similarity_graph: Đồ thị thể hiện mức độ tương đồng giữa các câu.

        Trả về:
            Điểm TextRank cho mỗi câu.
        """
        return pagerank(similarity_graph, alpha=0.85, tol=0.0001)

    def get_selected_indices(self, text_rank, max_sentences):
        """
        Lựa chọn các chỉ số của các câu có điểm TextRank cao nhất.

        Tham số:
            text_rank: Điểm TextRank cho mỗi câu.
            max_sentences: Số lượng câu tối đa trong tóm tắt.

        Trả về:
            Danh sách các chỉ số của các câu được chọn.
        """
        sorted_rank = sorted(text_rank.items(), key=lambda item: item[1], reverse=True)
        selected_indices = [item[0] for item in sorted_rank[:max_sentences]]
        return selected_indices

    def summarize(self, content):
        """
        Tóm tắt văn bản.

        Tham số:
            content: Văn bản cần tóm tắt.

        Trả về:
            Tóm tắt văn bản.
        """
        sentences = self.split_to_sentences(content)
        similarity_graph = self.get_similarity_graph(sentences)
        text_rank = self.get_text_rank(similarity_graph)
        selected_indices = self.get_selected_indices(text_rank, self.max_sentences)
        summary = " ".join([sentences[i] for i in selected_indices])
        return summary