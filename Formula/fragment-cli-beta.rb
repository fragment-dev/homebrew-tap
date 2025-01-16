require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6093.0.0-darwin-x64.tar.gz"
    sha256 "7cbe5bb5cb549ea84a593e69076f801d9d4d8fe9f48d15ba798cc3845d71cc41"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6093.0.0-darwin-arm64.tar.gz"
      sha256 "4b42193b420623ceaf64c5334167362d7d9571cd547fcfceb750b436e2513f7b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6093.0.0-linux-x64.tar.gz"
    sha256 "f62911edad115ad59d109e6f1a716a253f3edd7d67e431834f9f760cf14fb9a8"
  end
  version "6093.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
