require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.5-darwin-x64.tar.gz"
    sha256 "12922d43c2be84e96dee88816f4552832feb3ceff2a00760da218ceab50ab351"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.5-darwin-arm64.tar.gz"
      sha256 "d1b8a630e7ecc3c22cd960b599cf56639429595bb9d3b4af1a9dff651ab9343f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.5-linux-x64.tar.gz"
    sha256 "1c125bb861bec650d732813ff833cab8d71c8726e2d3fa1fac2eee8fae27a34f"
  end
  version "2024.3.5"
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
