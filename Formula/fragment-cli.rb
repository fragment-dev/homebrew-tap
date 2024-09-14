require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.13-darwin-x64.tar.gz"
    sha256 "731ac7c59a56e6cbd7b1d382c73aeb7f25005e1ddc4a21f4104d22c50a5063ce"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.13-darwin-arm64.tar.gz"
      sha256 "b2455f6175c7ae38f13d847c9ec050abe05220b409f3725b275ab1201fed9250"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.13-linux-x64.tar.gz"
    sha256 "bfd82dc5aff42ed85fd0ca8b5dcce633c3341bace53eccb4ef713a82f243bb55"
  end
  version "2024.9.13"
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
