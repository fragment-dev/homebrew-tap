require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2945.0.0-darwin-x64.tar.gz"
    sha256 "95e07079821de2a5d4e008823d9ba66e4772bd588487303802318e4da18ca01b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2945.0.0-darwin-arm64.tar.gz"
      sha256 "92c463ec59d5131983f63f3716ff9fd22e822175068cba50e20d57c49efb13ad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2945.0.0-linux-x64.tar.gz"
    sha256 "6d97ab725fcc4e4ec84daa85f7921eb8ec8b8dbf5676ac86355289983b1aee52"
  end
  version "2945.0.0"
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
