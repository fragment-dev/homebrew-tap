require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3854.0.0-darwin-x64.tar.gz"
    sha256 "d7e97ad44ee98e7efb7bb5cab5b937989b84bc9f8ae9780f9b5f17bfbd322e17"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3854.0.0-darwin-arm64.tar.gz"
      sha256 "6df63df4be8ee8740ce9ce95774063cbbdf2bcfd274623d5381cee7d4755c595"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3854.0.0-linux-x64.tar.gz"
    sha256 "21183be8536c5d30a4d8c088451963b5045867a0f481cde832c32ab6842ab98c"
  end
  version "3854.0.0"
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
