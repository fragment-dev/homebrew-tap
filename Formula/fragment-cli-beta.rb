require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4851.0.0-darwin-x64.tar.gz"
    sha256 "b80ced95644cb0ec933fef979fa0b57d4e68e3ba2c4002ee0c5466a332fe372a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4851.0.0-darwin-arm64.tar.gz"
      sha256 "54e1183e77fe4c62874c6df29fda1e72e9bf22a9c8fbd8f0ab742d517b52f2b7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4851.0.0-linux-x64.tar.gz"
    sha256 "e77dde27a040af422adbcc7369f4d627d9399b281776de6c5c11dc3329e15d5f"
  end
  version "4851.0.0"
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
