require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3593.0.0-darwin-x64.tar.gz"
    sha256 "99c669e77a7c4863502cefb1011dbe9ef27f8fb45e589bc97805af845e5cc5cf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3593.0.0-darwin-arm64.tar.gz"
      sha256 "6305432f6bddc3181e9d1a7f6e322333913d045595ea3a4746853bf22d2e3728"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3593.0.0-linux-x64.tar.gz"
    sha256 "e7fc23722242e087edfe2f17503662cb16b820a067aae2b65d65bf19eb05d307"
  end
  version "3593.0.0"
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
