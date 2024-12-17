require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5909.0.0-darwin-x64.tar.gz"
    sha256 "84f61e873a8fb42a9bbdb0cfd3140a4cb9794304a58e6edaf630c305174cce91"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5909.0.0-darwin-arm64.tar.gz"
      sha256 "48897a0d97b9f7c6995a7789daad47879f5ebc8e829df015d61c1e5b5fe2c048"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5909.0.0-linux-x64.tar.gz"
    sha256 "85e0ca508c77f1b9f2a170c85138045857836669a81c2597050d9113f041832e"
  end
  version "5909.0.0"
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
