require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.10-1-darwin-x64.tar.gz"
    sha256 "b2724d50816792319d320ba6cd075f25dbd17b1f605831a1e14a4587f8c72a5b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.10-1-darwin-arm64.tar.gz"
      sha256 "84e421f07e72efd34a6d6386401e82bdefa9bde4b16e8a0474e7d02b8ac4dacc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.10-1-linux-x64.tar.gz"
    sha256 "ea29a3d7272985ce9427a8bad4365a251cce4121b10d5afe8033e2299cb4257f"
  end
  version "2024.7.10-1"
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
