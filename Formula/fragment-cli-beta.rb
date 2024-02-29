require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4678.0.0-darwin-x64.tar.gz"
    sha256 "8668fa33412ec4632d6cf98a2ede198f7d9aee4805ecd6ae115b7500041afd0d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4678.0.0-darwin-arm64.tar.gz"
      sha256 "4bf5992a0174d284c409a7fecf8dbb08030688fb205ab5092169802034c1a610"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4678.0.0-linux-x64.tar.gz"
    sha256 "aac28632f3a3a6b36688d13f637db8e5e9e2c6ba89f52cee3a6d510f69ab6fdf"
  end
  version "4678.0.0"
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
