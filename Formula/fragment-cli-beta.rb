require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6113.0.0-darwin-x64.tar.gz"
    sha256 "1fb33fb7f7aeacdbb36655ee6332b9463ae94c6fe6f132ee16e6a2ed67602ebb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6113.0.0-darwin-arm64.tar.gz"
      sha256 "ea1bdd183db8b99ae06d66f8ca170238caa55e177517b714514a0c771f365a88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6113.0.0-linux-x64.tar.gz"
    sha256 "5044b9cbb9b55e604ce9781945eadb2c66e363aedd0c1e7dfd73f4071aaae1b3"
  end
  version "6113.0.0"
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
