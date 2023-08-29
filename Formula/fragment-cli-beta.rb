require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3417.0.0-darwin-x64.tar.gz"
    sha256 "8ab9f4de8a472d927a96fa6b8cac6c8f0e5f798d8854e3b82c50b5684c62448d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3417.0.0-darwin-arm64.tar.gz"
      sha256 "17d35e01da4eaad29a93642c9baddf11ce008e8f806ac0bceabb4b944bccb6c2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3417.0.0-linux-x64.tar.gz"
    sha256 "003753336fc8e4a065790606a4dad66d8662483c6d765900ebebf00f3921da02"
  end
  version "3417.0.0"
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
