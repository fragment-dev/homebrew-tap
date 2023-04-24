require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2508.0.0-darwin-x64.tar.gz"
    sha256 "180167fb4fb7095a8c62d2fcd2fba03d46ffda4a6a8c2ab64cc1ed9b6a744727"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2508.0.0-darwin-arm64.tar.gz"
      sha256 "98fd15219d2d6de4e96b08d0edfc3081157d7b31bf67d9713342464b2eef5c10"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2508.0.0-linux-x64.tar.gz"
    sha256 "7d5b2124335b45418fa75a95e4b450625094eff5675f586cd7ca51cfd37dbd3e"
  end
  version "2508.0.0"
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
