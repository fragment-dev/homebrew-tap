require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5119.0.0-darwin-x64.tar.gz"
    sha256 "bd8fc2194b878e8eb9d24dbbaa1393d7e9c79d0efd698d7b6ffdbac46693cc6d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5119.0.0-darwin-arm64.tar.gz"
      sha256 "06bc4460d9bdfd6bdfebbf1dd47eafaa9f03851f395041a56dd015392b09410d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5119.0.0-linux-x64.tar.gz"
    sha256 "39e1e4a1301ee05923f0d969560d9981e94dddd6c218a778ad158c4b46364bcc"
  end
  version "5119.0.0"
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
