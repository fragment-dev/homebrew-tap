require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5636.0.0-darwin-x64.tar.gz"
    sha256 "7cb9e04272b12b2eb0a4fc4e17e30da999aa7a17b99b2a7622a3fc54774d76c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5636.0.0-darwin-arm64.tar.gz"
      sha256 "e25fa25ff564835f39c7a0f556dab59e567c0be02bd5fdf8739076f57020d9a2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5636.0.0-linux-x64.tar.gz"
    sha256 "adc516e6f3bf56571b52098f540d6e664bd908dbcae46e8f0f357d34850de777"
  end
  version "5636.0.0"
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
