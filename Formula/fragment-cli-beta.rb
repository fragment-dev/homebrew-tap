require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3469.0.0-darwin-x64.tar.gz"
    sha256 "1ae5da8f6a7831205186a52420fd2ebefdbd6f5597c0c848e0108f4bf2fed2d1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3469.0.0-darwin-arm64.tar.gz"
      sha256 "86cbfdabd787575a9417ac630c39b5448742885a2fbaf40bcf09787800bdb6a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3469.0.0-linux-x64.tar.gz"
    sha256 "10da43b4b949fb58100b51fcc142569f534b7a591255d34d5d681cf62f7bbefa"
  end
  version "3469.0.0"
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
