require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5557.0.0-darwin-x64.tar.gz"
    sha256 "0a81cd1e9e86bfd7036a0881fe5f664f2f98747376391fe8158a57c77b45dd0c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5557.0.0-darwin-arm64.tar.gz"
      sha256 "b7df97ffdb021f649026f5fdf9977a818bdc5530b50442335bb71ac23f5327b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5557.0.0-linux-x64.tar.gz"
    sha256 "c3166f1d6c2ad38a38a593ab2ead8150ec75c5b73b85bea520434fc6e64e7e32"
  end
  version "5557.0.0"
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
