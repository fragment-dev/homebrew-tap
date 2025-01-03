require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6034.0.0-darwin-x64.tar.gz"
    sha256 "69b8a9d2902758db9517a18f53cc19491e8be094f27d2860e25dc0fbffbac913"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6034.0.0-darwin-arm64.tar.gz"
      sha256 "2e003a11333f9188fa589bc8bc5c483fb84a6a688bf01d69693dd22c688a8865"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6034.0.0-linux-x64.tar.gz"
    sha256 "823c47f85ca625466be5d7f9049b7e1712d115fb7b7384ccf4bab11fb993faee"
  end
  version "6034.0.0"
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
