require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5433.0.0-darwin-x64.tar.gz"
    sha256 "eadcfa8e8d77c1992bc228fecaf9a32804dcdfac8d38976f11fac969fe686dfa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5433.0.0-darwin-arm64.tar.gz"
      sha256 "03a13505519190e54e3f7db5defdbd5f784ddcc0d34028382462cafabf4cd093"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5433.0.0-linux-x64.tar.gz"
    sha256 "439e900be7c9e9d8fcd4ee10561eb04147d5b79bcba270c2950e89062a60dcee"
  end
  version "5433.0.0"
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
