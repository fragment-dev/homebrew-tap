require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4264.0.0-darwin-x64.tar.gz"
    sha256 "339602560250ed1492edf081f440716eb7c6b00fa19629658492c42060b0eeca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4264.0.0-darwin-arm64.tar.gz"
      sha256 "1a6c51dd7316b9399773269470e54667b36ed7bf81c9e4009bed8f8349dcd6ef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4264.0.0-linux-x64.tar.gz"
    sha256 "3ae0c8efbad6a7d0d341ac616e6761a80b28b79e6678ceaeaa26c4f8fe6e6fcd"
  end
  version "4264.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
