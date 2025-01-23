require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-2-darwin-x64.tar.gz"
    sha256 "74ff270570112d8ea7fb16d18643a6edd53a20115e5b91b470d81e33d6dc96b8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-2-darwin-arm64.tar.gz"
      sha256 "e263e7424ebf63c4c47003e78939c988dbe38d12dcc1c97f088dd2645b129b10"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-2-linux-x64.tar.gz"
    sha256 "d20274451d05a747b4c4935ad5f1ea7d7240be99eb3a433e95c73bb31203e674"
  end
  version "2025.1.23-2"
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
