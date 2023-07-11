require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3039.0.0-darwin-x64.tar.gz"
    sha256 "db594b3fc23b5e967d744c326c2ad44b0a3726ff4f22a49663181e836a4db28c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3039.0.0-darwin-arm64.tar.gz"
      sha256 "b43a2e4370fe2ad50737a1f4d344d9200c4f86322887a13806268df49938800e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3039.0.0-linux-x64.tar.gz"
    sha256 "cd156fe3a4adc35c36c39cc94df6c3a5cbe35bda1872dc14985986771797fb6f"
  end
  version "3039.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
