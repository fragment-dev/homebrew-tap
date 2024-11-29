require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5841.0.0-darwin-x64.tar.gz"
    sha256 "88d8d2ad1475639c8ca45d3f0567ea21d1ef1548306c57324bf6878f5a641640"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5841.0.0-darwin-arm64.tar.gz"
      sha256 "22963d87f77222a02da61ac9bded21ee7be8d23abb942327178135a05ff40cfc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5841.0.0-linux-x64.tar.gz"
    sha256 "8ed16b9f8702690ea93afb5a6fca745cd672146de5509e7342b0907e8befb937"
  end
  version "5841.0.0"
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
