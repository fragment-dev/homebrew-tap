require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4872.0.0-darwin-x64.tar.gz"
    sha256 "6e8e5928bd6d4fe9aef85264ef70ba3918aca75b840b9e1650cf27cfadb666fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4872.0.0-darwin-arm64.tar.gz"
      sha256 "f08924f2341d1cf227849a5888de181584ef86e5a7a199b22e64f6fd11dd25d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4872.0.0-linux-x64.tar.gz"
    sha256 "a10a19cd1f92f0858fc68609d293df7051411efd5879acf464718be74f2e390c"
  end
  version "4872.0.0"
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
