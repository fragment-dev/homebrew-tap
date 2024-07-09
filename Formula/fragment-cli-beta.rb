require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5373.0.0-darwin-x64.tar.gz"
    sha256 "5f2746be1c2a59f9ea97a2f8c4ab4ccd12953c491ebaa57fc532043fd227e121"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5373.0.0-darwin-arm64.tar.gz"
      sha256 "1f24fb7ad28fcaa5346fb92da4be491006d7b9f572bb286eac45fead04875905"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5373.0.0-linux-x64.tar.gz"
    sha256 "54e76580509271e17d1f58385f8b2e1bfe01677a6554a65a30d5cffff77e27e2"
  end
  version "5373.0.0"
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
