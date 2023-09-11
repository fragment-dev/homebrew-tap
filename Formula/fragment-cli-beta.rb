require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3518.0.0-darwin-x64.tar.gz"
    sha256 "4e976a78e0105fdd9f84fb482178bc50c61baf0389252e55b94a101295e62c18"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3518.0.0-darwin-arm64.tar.gz"
      sha256 "a1b855bb95bbee3ad35ea0c902c6cbcb7fd39523989cf940327028e1bf51e56c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3518.0.0-linux-x64.tar.gz"
    sha256 "c98349a5eedf2b7c4eda1e829a01f8ab4e585d8cbc5703d0f4184cf09a0463d3"
  end
  version "3518.0.0"
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
