require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4272.0.0-darwin-x64.tar.gz"
    sha256 "472d0d38b298dc3167453f629ca20c862247238499f7bf9d68e0f470166387c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4272.0.0-darwin-arm64.tar.gz"
      sha256 "08d120e027c93c1ed97ae2686be9e9890cf00af03c51400f6dfe9775bfca32d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4272.0.0-linux-x64.tar.gz"
    sha256 "6665e12d794dc180ba7ce123513148ada635d2917f5106c20b16154039a1a37f"
  end
  version "4272.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
