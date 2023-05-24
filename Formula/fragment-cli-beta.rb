require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2736.0.0-darwin-x64.tar.gz"
    sha256 "ef0f28ca3370575620c84abdfaa03cb4014cf94366ea4fe426d7eb710e3d15df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2736.0.0-darwin-arm64.tar.gz"
      sha256 "61cfc466ea5e2dee4f0b7e9e08bbe3347c51ccaa51aeef6fc00efdce43ce857e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2736.0.0-linux-x64.tar.gz"
    sha256 "a40dc949565f61ce2c560b7d45c30441a0c84c82f3a2f074ec4fa0c4d79f385b"
  end
  version "2736.0.0"
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
