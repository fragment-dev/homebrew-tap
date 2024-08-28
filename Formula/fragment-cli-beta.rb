require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5552.0.0-darwin-x64.tar.gz"
    sha256 "232c65781414b59fcff5b9b944c837822579e069eb76880a0d2cd3cefa30c09c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5552.0.0-darwin-arm64.tar.gz"
      sha256 "132e08487cc3ecac89d44ac52428e0f7eae25ad9af1dccede059d782827f47ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5552.0.0-linux-x64.tar.gz"
    sha256 "0b87f30ef8aec8d9787805c51e87e67e0243c24ca7cb04a1073519997dcf08eb"
  end
  version "5552.0.0"
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
