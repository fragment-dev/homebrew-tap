require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2935.0.0-darwin-x64.tar.gz"
    sha256 "853f656cdf61c1acf0920657a4a548708ffb908f950a7830eccf9bb257c238d3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2935.0.0-darwin-arm64.tar.gz"
      sha256 "e1ef460f731492971060dc9911b14b87288e02b3a22f91731ef1d265310945ca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2935.0.0-linux-x64.tar.gz"
    sha256 "d45bdc0aacec2ddcace9109d5cebe255bb032eddb162d0b450fd4998bbdcc4af"
  end
  version "2935.0.0"
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
