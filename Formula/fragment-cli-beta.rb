require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1799.0.0-darwin-arm64.tar.gz"
    sha256 "1fca166f1a8f05a8fda08580f7717e548d2d19ede72ec9ba919b86dffe407b48"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1799.0.0-darwin-arm64.tar.gz"
      sha256 "1413c9018d633f979fc9bbbf5734db48b9f968e5280d1975b41f3468a8506c5d"
    end
  end
  version "1799.0.0"
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
