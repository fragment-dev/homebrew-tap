require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3062.0.0-darwin-x64.tar.gz"
    sha256 "dd5a9344443b34cdfc312c49da836595cf630460ba3a845413954ce380ca0641"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3062.0.0-darwin-arm64.tar.gz"
      sha256 "b5c6f4041e7cdb138a58db52e2ad26d9d469228021c8ecd957d2b961bf54ec73"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3062.0.0-linux-x64.tar.gz"
    sha256 "0f121fd3db2bdad0083b3d27edae63b5ab40540dea620285ce9c8736fb7ceedf"
  end
  version "3062.0.0"
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
