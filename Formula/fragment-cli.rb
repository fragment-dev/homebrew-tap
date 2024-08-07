require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.7-darwin-x64.tar.gz"
    sha256 "012922d800644a1e6e5b6d72303282c37eaf3399b724ac6f7efe9417b1860db9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.7-darwin-arm64.tar.gz"
      sha256 "d58d24e869b3b3678ee42beca7c82ed1aef51274255edec68d2b607457841158"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.7-linux-x64.tar.gz"
    sha256 "67f8b7bf74a43fdef20d1b70976c3d35890981cc5f7c9ccb0489c6caec58638f"
  end
  version "2024.8.7"
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
