require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5199.0.0-darwin-x64.tar.gz"
    sha256 "614646422c2d2ef4fa3a1dc7b047295f1e2e437e75b274a276cdc478aa104980"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5199.0.0-darwin-arm64.tar.gz"
      sha256 "451b157f3668fa3af27a6e20cce97c72c446d171b2ab46febd715513fdda646f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5199.0.0-linux-x64.tar.gz"
    sha256 "fca54fa418c92e1755734108b80151f227cc322348becf10f45b3ecbfe7b9fbc"
  end
  version "5199.0.0"
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
