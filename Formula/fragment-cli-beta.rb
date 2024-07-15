require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5397.0.0-darwin-x64.tar.gz"
    sha256 "2f072a5a45219e647d79ef21049ec1eabce8199b847ecbe55cad09835a78be7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5397.0.0-darwin-arm64.tar.gz"
      sha256 "7080bdf14e21c5f5f709c2d88d5b57646242069aa2ef30bdb633326d920e119a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5397.0.0-linux-x64.tar.gz"
    sha256 "0993bbbca74b713539e72afd7fb19a6f03f4041c300a299eb6a6b33fe090a22f"
  end
  version "5397.0.0"
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
