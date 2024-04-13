require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.12-1-darwin-x64.tar.gz"
    sha256 "eaf32a098615330ed8e674b46bee129d856dcbc4e0a807ca4d2ef248a5245cd0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.12-1-darwin-arm64.tar.gz"
      sha256 "08600ba8189eba7bc8de3ca74ef29bb72199d143f9df306c51b7d6939823a3fb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.12-1-linux-x64.tar.gz"
    sha256 "c72b9c67a8e9455c86a22a891962af4f7b4008799d571e58cb471a047d2859d3"
  end
  version "2024.4.12-1"
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
