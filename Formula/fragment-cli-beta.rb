require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3884.0.0-darwin-x64.tar.gz"
    sha256 "d0fa4ef163d4ee80ecf9cf4197d7a250a5b564fe4ba23d162a3ea8a3333e6145"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3884.0.0-darwin-arm64.tar.gz"
      sha256 "f290c0418e17575af2d6229f5e51137f7ccf5ad54c76dc5a4053682c0bcd6ece"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3884.0.0-linux-x64.tar.gz"
    sha256 "f21d74b4faf14688cd738dd0e17acdb716b0f448c4e3a0c7aecf75ee0174bb97"
  end
  version "3884.0.0"
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
