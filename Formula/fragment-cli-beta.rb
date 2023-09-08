require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3503.0.0-darwin-x64.tar.gz"
    sha256 "f43e6b3ab4a28408d2905402bc05d66cda2db6abb20b81e10752843ee10ac5b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3503.0.0-darwin-arm64.tar.gz"
      sha256 "82517f2a20b599353aba1674bb722e0be0d3c47f6dc73d093862ca4553789d11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3503.0.0-linux-x64.tar.gz"
    sha256 "561b5ddf7ce7461f859ef91df5f6a7da8d36920d3ef7cd23393f34e231eeaa35"
  end
  version "3503.0.0"
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
