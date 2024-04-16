require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4902.0.0-darwin-x64.tar.gz"
    sha256 "01613f0daa430ad927ed00ed2a06e47956e3ff71ae6369709584a242d5b5c34a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4902.0.0-darwin-arm64.tar.gz"
      sha256 "33fe75c170022b13f57098542c5b1977f8476d83b0bb916e1c80e7e0a8c2e3b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4902.0.0-linux-x64.tar.gz"
    sha256 "95da19302a2ce119e50687e1a56924b8b651291004f78b97b3c9167fecac852c"
  end
  version "4902.0.0"
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
