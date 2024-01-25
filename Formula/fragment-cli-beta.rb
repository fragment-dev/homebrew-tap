require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4438.0.0-darwin-x64.tar.gz"
    sha256 "45f5a5f2a015a1176bac7b8ccef0fbae312644c6f69623674a2943339f749554"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4438.0.0-darwin-arm64.tar.gz"
      sha256 "bf8e9433c9f2aef94013f4471002c3725d75bcecd8da3c2e801571b531000d5f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4438.0.0-linux-x64.tar.gz"
    sha256 "184b138006b70366889e2c2b4e5ecad2cf874820d7e8cae305dbed22875363d7"
  end
  version "4438.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
