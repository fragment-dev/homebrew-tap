require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v9308.0.0-darwin-x64.tar.gz"
    sha256 "a702a34ad58dce3f7c5785c0bcfacc32f15edad763c3ce27767316a72065d98e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v9308.0.0-darwin-arm64.tar.gz"
      sha256 "df2ceab4ee98c7a75cf0c60137eef5a59105daa705ad12e05d6c369fed002eb6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v9308.0.0-linux-x64.tar.gz"
    sha256 "48488e6da3355344e6f3939661f905d133b3ed4e624219b4a90ec5e0b2da97bc"
  end
  version "9308.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    # The tarball ships without a Node runtime; point the launcher's
    # $DIR/node lookup at Homebrew's keg-only node@20.
    rm_f libexec/"bin/node"
    (libexec/"bin").install_symlink Formula["node@20"].opt_bin/"node" => "node"
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
