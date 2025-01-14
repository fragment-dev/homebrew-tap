require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6083.0.0-darwin-x64.tar.gz"
    sha256 "ae29544735527f4f27f17e6bea28deee6fd141cb0b0134cfcc8ef9cb08f5f7d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6083.0.0-darwin-arm64.tar.gz"
      sha256 "325388f033b10651e20d68d39ace4bc403d8366c86a6a59f76fc685fb7f3b7ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6083.0.0-linux-x64.tar.gz"
    sha256 "59eb815fb40064a740939a52966321f19975a4538080463c94d2a62802b612e8"
  end
  version "6083.0.0"
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
