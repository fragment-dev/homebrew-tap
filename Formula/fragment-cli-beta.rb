require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6969.0.0-darwin-x64.tar.gz"
    sha256 "457ddd8bcba22b4e1a6202ad3f3485c14d8ce6a80061b823fedee2f8eff2dd4b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6969.0.0-darwin-arm64.tar.gz"
      sha256 "850f324e7e47993d46917a1747f171ba359fe6781d580f74d7a08e0f268d175f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6969.0.0-linux-x64.tar.gz"
    sha256 "bdb0d8d15707805aa15c477be1fdb5e8557af8953d3d7c27debce7030c7f89ad"
  end
  version "6969.0.0"
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
