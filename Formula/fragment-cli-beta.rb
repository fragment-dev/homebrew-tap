require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3114.0.0-darwin-x64.tar.gz"
    sha256 "381289b5681cf10b08cd7850c8e309e46952564584be870cbcf556a539f5f105"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3114.0.0-darwin-arm64.tar.gz"
      sha256 "ba46ee63d7868d3d1cc79f22f43250e0945979e09da6f69b9ed96019e8593279"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3114.0.0-linux-x64.tar.gz"
    sha256 "3a95e1eb9fdd610cd123f6625fd26cb74c72ebd6a7f214b35dd0b2117a5ea987"
  end
  version "3114.0.0"
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
