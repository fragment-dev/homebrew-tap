require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3948.0.0-darwin-x64.tar.gz"
    sha256 "dace09b981e94f1b88807c4a6ff28a869f30207fe1b1ebf7a35a56eb354a34de"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3948.0.0-darwin-arm64.tar.gz"
      sha256 "bb333fb8e3463271e18d590e3aa7205298c014a5b78ee4ab7a245039c4128d28"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3948.0.0-linux-x64.tar.gz"
    sha256 "4500e9a68cffb98445f7e64254da4f1ce6cf616e4a8e221a7ffcc18b7cb98da8"
  end
  version "3948.0.0"
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
