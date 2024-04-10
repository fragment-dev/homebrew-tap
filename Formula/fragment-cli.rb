require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.8-darwin-x64.tar.gz"
    sha256 "679c70e412310406843b33839e8119cd21525392996695658e445ebfb72079b9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.8-darwin-arm64.tar.gz"
      sha256 "b46a300b83603783b9833c84b4f3d5b659c6cc02b2058c60a000cff22dc8dc31"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.8-linux-x64.tar.gz"
    sha256 "33743b49104e2b4148d32aacc56701c3a669ef6c70155538bb112cfcb99c353c"
  end
  version "2024.4.8"
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
