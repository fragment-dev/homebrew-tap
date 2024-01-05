require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4280.0.0-darwin-x64.tar.gz"
    sha256 "cb5dd41cd5629ce425af9662c59868e0c35e3373bb873b1892197d4890656abf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4280.0.0-darwin-arm64.tar.gz"
      sha256 "e54447e242d2da9add02f1a162574b29cce7a100088e3b21d2e9f091f20a49ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4280.0.0-linux-x64.tar.gz"
    sha256 "49666e55ebdea7b4dba7a0d20eb22c558722ac4876bcf7c5fae2e6de6b9c5731"
  end
  version "4280.0.0"
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
