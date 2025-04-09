require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.8-1-darwin-x64.tar.gz"
    sha256 "3ecfc4c7f928043b90452093ebdd00153e5b729a1a3145614658ede78d06e101"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.8-1-darwin-arm64.tar.gz"
      sha256 "a65cf2172f44300657ac2b203df28c129e452257ca9df1cf7f2d57a13ba0da99"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.8-1-linux-x64.tar.gz"
    sha256 "d38c30b32bb8794e74c7ffba32f807720fec666ea87bf2b38faf5cc71b8e920d"
  end
  version "2025.4.8-1"
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
