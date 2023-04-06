require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2370.0.0-darwin-x64.tar.gz"
    sha256 "b385d4ccf4bfc9f78753740990fc19c86109c89e6cd9400afe6c57e684f7b42d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2370.0.0-darwin-arm64.tar.gz"
      sha256 "6da661243913a363c68df1c505c8958e3a2dd19915244e053b73fa33b53d162e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2370.0.0-linux-x64.tar.gz"
    sha256 "62cc086683d07008b02fbd91e136482b83f6e0db21012106323f062866b2975a"
  end
  version "2370.0.0"
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
