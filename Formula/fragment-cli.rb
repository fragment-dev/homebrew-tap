require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.22-darwin-x64.tar.gz"
    sha256 "02242db8a30c980d3f26b34cbf932d565638e076cef09534ccfce8adc0b739a9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.22-darwin-arm64.tar.gz"
      sha256 "f3761b75642aaa7f40acc0aef08ab955e01885a677546e4560adff84ab34f0d2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.22-linux-x64.tar.gz"
    sha256 "fd5273056ffb9282663fe49e434feb9f682a4370c87f008b99bbf308943de844"
  end
  version "2024.11.22"
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
