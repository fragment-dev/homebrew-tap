require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.26-2-darwin-x64.tar.gz"
    sha256 "61ec4a3c1ed15d75324a33216848afb56abd68813e73117af01f33fd052057f9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.26-2-darwin-arm64.tar.gz"
      sha256 "43b80a5db1d1a30510a5b9b114eafbcfab4cb23099da6ce907f1066c4845e155"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.26-2-linux-x64.tar.gz"
    sha256 "ad5f27ec40ec236fd93a547fb384c1297a08d1ac09ec3bbc516bb27892a83b3b"
  end
  version "2023.6.26-2"
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
