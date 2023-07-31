require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3194.0.0-darwin-x64.tar.gz"
    sha256 "3982e6b50d9de3ae1a6b52e82a843540816c5fa4698fc042d9e9b5f793a09f52"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3194.0.0-darwin-arm64.tar.gz"
      sha256 "3b72c9169b2bc3d9e3a65ecc90fef07f54f9b357ee0d214be31f2de9db4aac6a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3194.0.0-linux-x64.tar.gz"
    sha256 "91f237d85ab32bd8b790652a62d7ee93dadb49e43e1873e2c5f34ae26ce4d096"
  end
  version "3194.0.0"
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
