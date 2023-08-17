require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3338.0.0-darwin-x64.tar.gz"
    sha256 "42977d84968077e0347ca0fe610482c07bd9a2c3e8c36aea24ef561990c70ddd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3338.0.0-darwin-arm64.tar.gz"
      sha256 "9e01adb169d673ff528bf041651d7c0fd895e102f06a682b98f4db88e1a82e83"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3338.0.0-linux-x64.tar.gz"
    sha256 "1473295b52465e02c27d0b66341497fd2a6f0ec0d6e643868c1868b9f200ce39"
  end
  version "3338.0.0"
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
