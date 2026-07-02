require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.7.2-darwin-x64.tar.gz"
    sha256 "5e539806b1c5600f399d5997706e989912dec09668dfeb7358d09ffc7be248c3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.7.2-darwin-arm64.tar.gz"
      sha256 "989ffccd549120c6a7080261875a59ce4e7bd9e9b66b2464f12e2ed14f7c28a5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.7.2-linux-x64.tar.gz"
    sha256 "6832f2507f29f8a7b4cf6d9263c6953903ecedf4582f32d5c4016a195a1e6b46"
  end
  version "2026.7.2"
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
