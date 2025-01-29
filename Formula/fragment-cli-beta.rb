require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6136.0.0-darwin-x64.tar.gz"
    sha256 "fbe9c450470d61fbb0b926096d90a848e74886021b9ddfa88bb9fa99fba3c1ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6136.0.0-darwin-arm64.tar.gz"
      sha256 "4f0951ba66911ebecf950b88e956fac281afc1114c4cc46220ae41ba6cac0376"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6136.0.0-linux-x64.tar.gz"
    sha256 "cad743bf9561a6962431faa7b2e8156381c1a3d227303d36b12b05d620ff52ca"
  end
  version "6136.0.0"
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
